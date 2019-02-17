namespace ConsoleApp1.Models
{
    using System;
    using System.Data.Entity;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Linq;

    public partial class Model1 : DbContext
    {
        public Model1()
            : base("name=Model1")
        {
        }

        public virtual DbSet<category> categories { get; set; }
        public virtual DbSet<tree_paths> tree_paths { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<category>()
                .HasMany(e => e.tree_paths)
                .WithRequired(e => e.category)
                .HasForeignKey(e => e.ancestor)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<category>()
                .HasMany(e => e.tree_paths1)
                .WithRequired(e => e.category1)
                .HasForeignKey(e => e.descendant)
                .WillCascadeOnDelete(false);
        }
    }
}
