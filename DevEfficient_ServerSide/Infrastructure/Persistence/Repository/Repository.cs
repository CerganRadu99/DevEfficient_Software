using Domain.Core;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace Infrastructure.Persistence.Repository
{
    public class Repository<T> : IRepository<T> where T : class
    {
        protected readonly DevEfficientDbContext _dbContext;
        protected readonly DbSet<T> _dbSet;
        public Repository(DevEfficientDbContext dbContext)
        {
            _dbContext = dbContext;
            _dbSet = _dbContext.Set<T>();
        }

        public async Task<IEnumerable<T>> GetAll()
        {
            return await _dbSet.AsNoTracking().ToListAsync();
        }

        public async Task<T> GetById(Guid id)
        {
            return await _dbSet.FindAsync(id);
        }

        public async Task<int> Register(T dataToRegister)
        {
            _dbSet.Add(dataToRegister);
            return await this._dbContext.SaveChangesAsync();
        }

        public async Task<int> Update(T dataToUpdate)
        {
            _dbSet.Update(dataToUpdate);
            return await this._dbContext.SaveChangesAsync();
        }

        public async Task<int> Delete(T entity)
        {
            _dbSet.Remove(entity);
            return await this._dbContext.SaveChangesAsync();
        }
    }
}
