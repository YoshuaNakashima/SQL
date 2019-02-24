using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ConsoleApp1.Models;
using Newtonsoft.Json;

namespace ConsoleApp1
{
    public static class Class1
    {
        private static Model1 db = new Model1();

        public static void GetValueFromHierarchy()
        {
            db.Database.Log = log => System.Diagnostics.Debug.WriteLine(log);

            long[] ids = new long[] { 3, 8, 159, 160, 161 };

            var result = GetSpecCategory(ids).Select(c => new { Id = c.id, Name = c.name, Depth = c.nth_child });

            string json = JsonConvert.SerializeObject(result);

            Console.WriteLine(json);
            Console.ReadKey();
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="ancestorIds"></param>
        /// <returns></returns>
        public static IEnumerable<category> GetSpecCategory(long[] ancestorIds)
        {
            var query = db.categories
                .Join(
                    GetEdge(ancestorIds).AsEnumerable(),
                    c => c.id,
                    i => i.descendant,
                    (category, tree_path) => category
                ).ToList();
            return query;
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="ancestorIds"></param>
        /// <returns></returns>
        public static IQueryable<tree_paths> GetEdge(long[] ancestorIds)
        {
            IQueryable<tree_paths> query = db.tree_paths;
            foreach (long ancestorId in ancestorIds)
            {
                query = GetPath(query, ancestorId);
            }
            return query;
        }

        /// <summary>
        /// 
        /// </summary>
        public static IQueryable<tree_paths> GetPath(IQueryable<tree_paths> paths, long ancestorId)
        {
            return paths.Join(
                db.tree_paths.Where(p => p.ancestor == ancestorId),
                o => o.ancestor,
                i => i.descendant,
                (outer, inner) => outer
            );
        }
    }
}
