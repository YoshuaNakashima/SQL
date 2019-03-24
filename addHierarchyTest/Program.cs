using System;
using System.Collections.Generic;
using System.Linq;

namespace addHierarchyTest
{
    class Program
    {
        private const string LINE = "---------";
        private const char SPLITTER = ',';

        static void Main(string[] args)
        {
            Console.WriteLine("Hello World!");
            string path = $"aaa{SPLITTER}bbb{SPLITTER}ccc{SPLITTER}ddd";
            string[] nodeNames = path.Split(SPLITTER);
            List<Node> nodes = new List<Node>();
            for (int i = 0; i < nodeNames.Length; i++)
            {
                nodes.Add(new Node() 
                { 
                    Id = i + 1,
                    Name = nodeNames[i] 
                });
            }

            NodePath nodePath = new NodePath();
            IEnumerable<Path> paths = nodePath.GetChildPath(nodes);

            Console.WriteLine(LINE);
            foreach (var item in nodes)
            {
                Console.WriteLine($"id:{item.Id}, name:{item.Name}");
            }

            Console.WriteLine(LINE);
            foreach (var item in paths)
            {
                Console.WriteLine($"anc: {item.Ancestor}, dsc: {item.Descendant}");
            }

            List<Path> testPaths = new List<Path>()
            {
                new Path() { Ancestor = 1, Descendant = 1 },
                new Path() { Ancestor = 2, Descendant = 2 },
                new Path() { Ancestor = 3, Descendant = 3 },
                new Path() { Ancestor = 4, Descendant = 4 },
                new Path() { Ancestor = 5, Descendant = 5 },
            };

            var result = paths
                .Where(p => 
                    !testPaths.Any(q => 
                        q.Ancestor == p.Ancestor && 
                        q.Descendant == p.Descendant));

            Console.WriteLine(LINE);
            foreach (var item in result)
            {
                Console.WriteLine($"anc: {item.Ancestor}, dsc: {item.Descendant}");
            }
        }
    }

    public class NodePath
    {
        public Path GetSelfPath(Node node)
        {
            return new Path() { Ancestor = node.Id, Descendant = node.Id };
        }

        public IEnumerable<Path> GetChildPath(IEnumerable<Node> nodes)
        {
            if (nodes.Count() == 0 || nodes == null)
                return null;

            var ancNode = nodes.First();
            List<Path> result = new List<Path>();
            var selfPath = GetSelfPath(ancNode);
            result.Add(selfPath);

            var chileNode = nodes?.Skip(1);
            var childs = GetChildPath(chileNode);
            if (childs == null)
                return result;

            result.AddRange(childs);
            var hierarchyPath = childs ?
                .Where(n => n.Ancestor == n.Descendant) ?
                .Select(n => new Path()
                {
                    Ancestor = ancNode.Id,
                    Descendant = n.Descendant
                });

            result.AddRange(hierarchyPath);
            return result;
        }
    }

    public class Node
    {
        public int Id { get; set; }
        public string Name { get; set; }
    }

    public class Path
    {
        public int Ancestor { get; set; }
        public int Descendant { get; set; }
    }
}
