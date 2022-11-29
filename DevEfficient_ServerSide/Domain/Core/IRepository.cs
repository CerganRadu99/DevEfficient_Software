using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace Domain.Core
{
    public interface IRepository<T> where T: class
    {
        public Task<IEnumerable<T>> GetAll();

        public Task<T> GetById(Guid id);
        public Task<int> Register(T dataToRegister);

        public Task<int> Update(T dataToUpdate);

        public Task<int> Delete(T entity);
    }
}
