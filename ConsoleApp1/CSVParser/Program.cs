using System;
using System.Collections;
using System.Collections.Generic;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;
using Microsoft.VisualBasic.FileIO;

namespace CSVParser
{
    class Program
    {
        static void Main(string[] args)
        {
            string path = "CSVParser.Resources.test.csv";
            List<string[]> csv = CSVFieldParser.ReadCsvStreamToListAsync(path);
            string[] csvHeader = csv.First();
            ModelMapper<Student> modelMapper = new ModelMapper<Student>(csvHeader);
            List<Student> students = new List<Student>();
            IEnumerable<string[]> csvBody = csv.Skip(1);
            foreach (var row in csvBody)
            {
                Student student = modelMapper.MapToModel(row);
                students.Add(student);
                Trace.WriteLine($"ID:{student.ID},Name:{student.Name}");
            }
        }
    }

    // TODO:ModelMapper
    //   Dinamic
    // CSV TO Model

    public class Student
    {
        public string ID { set; get; }

        public string Name { set; get; }
    }



    public class ModelMapper<TModel> where TModel : new()
    {
        private string[] header;
        private TModel model;

        public TModel Model { get { return model; } }

        public ModelMapper(string[] csvHeader)
        {
            header = csvHeader;
            Type type = typeof(TModel);
            try
            {
                model = (TModel)Activator.CreateInstance(type);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public TModel MapToModel(string[] csvValue)
        {
            for (int i = 0; i < header.Length; i++)
            {
                MapToProperty(header[i], csvValue[i]);
            }
            return model;
        }

        private void MapToProperty(string propertyName, string value)
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


    public static class CSVFieldParser
    {
        public static List<string[]> ReadCsvStreamToListAsync(
            string csvResourcePath,
            Encoding encoding = null,
            string delimiter = ",")
        {
            Encoding enc = encoding;

            if (enc == null)
                enc = Encoding.GetEncoding(932);

            TextFieldParser textFieldParser = null;
            try
            {
                Assembly thisAssembly = Assembly.GetExecutingAssembly();
                using (Stream csvFileStream = thisAssembly.GetManifestResourceStream(csvResourcePath))
                {
                    //Shift JISで読み込む
                    textFieldParser = new TextFieldParser(csvFileStream, enc);
                    return ReadCsvToListAsync(textFieldParser, encoding, delimiter);
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public static List<string[]> ReadCsvFileToListAsync(
            string csvFileName,
            Encoding encoding = null,
            string delimiter = ",")
        {
            Encoding enc = encoding;

            if (enc == null)
                enc = Encoding.GetEncoding(932);

            TextFieldParser textFieldParser = null;
            try
            {
                //Shift JISで読み込む
                textFieldParser = new TextFieldParser(csvFileName, enc);
                return ReadCsvToListAsync(textFieldParser, encoding, delimiter);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="csvFileName">CSVファイル名</param>
        public static List<string[]> ReadCsvToListAsync(
            TextFieldParser textFieldParser,
            Encoding encoding = null,
            string delimiter = ",")
        {
            //フィールドが文字で区切られているとする
            //デフォルトでDelimitedなので、必要なし
            textFieldParser.TextFieldType = FieldType.Delimited;

            //区切り文字を,とする
            textFieldParser.Delimiters = new string[] { delimiter };

            //フィールドを"で囲み、改行文字、区切り文字を含めることができるか
            //デフォルトでtrueなので、必要なし
            textFieldParser.HasFieldsEnclosedInQuotes = true;
            
            //フィールドの前後からスペースを削除する
            //デフォルトでtrueなので、必要なし
            textFieldParser.TrimWhiteSpace = true;

            List<string[]> csvRows = new List<string[]>();
            try
            {
                while (!textFieldParser.EndOfData)
                {
                    //フィールドを読み込む
                    string[] fields = textFieldParser.ReadFields();
                    //保存
                    csvRows.Add(fields);
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }

            //後始末
            textFieldParser.Close();

            return csvRows;
        }
    }
}
