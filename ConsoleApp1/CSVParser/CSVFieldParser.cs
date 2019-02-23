using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;
using Microsoft.VisualBasic.FileIO;

namespace CSVParser
{
    public static class CSVFieldParser
    {
        public static List<string[]> ReadCsvFileStreamToListAsync(
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
                using (StreamReader csvFileStream = new StreamReader(csvResourcePath))
                {
                    //Shift JISで読み込む
                    textFieldParser = new TextFieldParser(csvFileStream.BaseStream, enc);
                    return ReadCsvToListAsync(textFieldParser, encoding, delimiter);
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public static List<string[]> ReadCsvAssemblyToListAsync(
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
