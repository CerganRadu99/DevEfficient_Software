using Domain.Entities;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace Domain.Core
{
    public interface IStateRepository: IRepository<State>
    {
        public Task<State> GetStateByName(string stateName);
    }
}
