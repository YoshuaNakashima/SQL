using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;

namespace CSVParser
{
    /// <summary>
    /// CSV のヘッダー名と同じ名称のプロパティを持つ Model にデータをマップします。
    /// </summary>
    /// <typeparam name="TModel"></typeparam>
    public class ModelMapper<TModel> where TModel : new()
    {
        private string[] header;
        readonly Type type;

        public ModelMapper(string[] csvHeader)
        {
            header = csvHeader;
            type = typeof(TModel);
        }

        public TModel MapToNewModel(string[] csvValue)
        {
            TModel model;
            try
            {
                model = (TModel)Activator.CreateInstance(type);
            }
            catch (Exception ex)
            {
                throw ex;
            }

            for (int i = 0; i < header.Length; i++)
            {
                model = MapToProperty(header[i], csvValue[i], model);
            }
            return model;
        }

        private TModel MapToProperty(string propertyName, string value, TModel model)
        {
            PropertyInfo property = null;
            try
            {
                property = typeof(TModel).GetProperty(propertyName);
            }
            catch (Exception ex)
            {
                throw ex;
            }

            Type propertyType = property.PropertyType;
            object setValue = null;
            setValue = ParseOrDefault(value, propertyType);
            try
            {
                property.SetValue(model, setValue);
            }
            catch (Exception ex)
            {
                throw ex;
            }

            return model;
        }

        private object ParseOrDefault(string value, Type propertyType)
        {
            object result = null;
            if (propertyType == typeof(string))
            {
                result = value;
            }
            else if (propertyType == typeof(int))
            {
                result = TryParse<int>(propertyType, int.TryParse(value, out int res), res, 0);
            }
            else if (propertyType == typeof(bool))
            {
                result = TryParse<bool>(propertyType, bool.TryParse(value, out bool res), res, false);
            }
            return result;
        }

        private object TryParse<TValue>(Type propertyType, bool tryReturn, TValue tryResult, TValue defaultValue)
        {
            object returnValue;
            if (tryReturn)
            {
                if (IsOfNullableType(propertyType))
                {
                    returnValue = null;
                }
                else
                {
                    returnValue = defaultValue;
                }
            }
            else
            {
                returnValue = tryResult;
            }
            return returnValue;
        }

        bool IsOfNullableType(Type type)
        {
            bool result;
            try
            {
                result = Nullable.GetUnderlyingType(type) != null;
            }
            catch (Exception ex)
            {

                throw ex;
            }
            return result;
        }
    }
}
