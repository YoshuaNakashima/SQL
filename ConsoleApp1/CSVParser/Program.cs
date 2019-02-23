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
            //string path = "CSVParser.Resources.test.csv";
            //List<string[]> csv = CSVFieldParser.ReadCsvAssemblyToListAsync(path);
            string path = "Resources\\test.csv";
            List<string[]> csv = CSVFieldParser.ReadCsvFileStreamToListAsync(path);
            string[] csvHeader = csv.First();
            ModelMapper<Student> modelMapper = new ModelMapper<Student>(csvHeader);
            List<Student> students = new List<Student>();
            IEnumerable<string[]> csvBody = csv.Skip(1);
            foreach (var row in csvBody)
            {
                Student student = modelMapper.MapToNewModel(row);
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
}
