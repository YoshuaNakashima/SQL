using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ConsoleApp1.Models;
using Newtonsoft.Json;

namespace ConsoleApp1
{
    class Program
    {
        private static Model1 db = new Model1();

        static void Main(string[] args)
        {
            Class1.GetValueFromHierarchy();

            var result = Program.GetModelHierarchy(2);

            string json = JsonConvert.SerializeObject(result);

            System.Diagnostics.Trace.WriteLine(json);
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="rootNode"></param>
        /// <returns></returns>
        public static Model[] GetModelHierarchy(long rootNode)
        {
            var newList = db.tree_paths
                .Where(t => t.ancestor == rootNode && t.path_length == 1)
                .Join(
                    db.categories,
                    o => o.descendant,
                    i => i.id,
                    (outer, inner) => new {
                        outer.ancestor,
                        outer.descendant,
                        outer.path_length,
                        inner.id,
                        inner.name,
                    }
                ).ToList();

            List<Model> models = null;
            if (newList.Count > 0)
            {
                models = new List<Model>();
                foreach (var item in newList)
                {
                    models.Add(new Model() {
                        Id = item.id,
                        Name = item.name,
                        Models = GetModelHierarchy(item.id)
                    });
                }
            }

            return models?.ToArray();
        }

        /// <summary>
        /// １階層下のリストのみ取得
        /// </summary>
        private IEnumerable<tree_paths> GetPath(IEnumerable<tree_paths> paths, long ancestorId)
        {
            return paths.Join(
                db.tree_paths.Where(p => p.ancestor == ancestorId && p.path_length == 1),
                o => o.ancestor,
                i => i.descendant,
                (outer, inner) => outer
            );
        }
    }

    public class Model
    {
        public long Id { get; set; }
        public string Name { get; set; }
        public IEnumerable<Model> Models { get; set; }
    }
}
