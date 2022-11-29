using Domain.Entities;
using Microsoft.EntityFrameworkCore;
using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.AspNetCore.Identity;

namespace Infrastructure.Persistence
{
    public class DevEfficientDbContext : IdentityDbContext<IdentityUser>
    {
        public DevEfficientDbContext(): base()
        {

        }
        public DevEfficientDbContext(DbContextOptions<DevEfficientDbContext> options, IConfiguration configuration): base(options)
        {
            _configuration = configuration;
        }

        private readonly IConfiguration _configuration;

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            optionsBuilder.UseSqlServer(_configuration.GetConnectionString("DbConnection"));
        }
        protected override void OnModelCreating(ModelBuilder builder)
        {
            builder.Entity<Item>().ToTable("Item");
            builder.Entity<ItemType>().ToTable("ItemType");
            builder.Entity<TeamMemberRole>().ToTable("TeamMemberRole");
            builder.Entity<Sprint>().ToTable("Sprint");
            builder.Entity<State>().ToTable("State");
            builder.Entity<Team>().ToTable("Team");
            builder.Entity<TeamMember>().ToTable("TeamMember");
            base.OnModelCreating(builder);
        }
    }
}
