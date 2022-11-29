using Domain.Dtos;
using Domain.Entities;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace Domain.Core
{
    public interface ISprintRepository: IRepository<Sprint>
    {
        public Task<RetrievedCurrentSprint> GetCurrentActivatedSprint();
        public Task<Sprint> GetCurrentSprint();
        public List<RetrievedItemDto> GetCurrentSprintItems();
    }
}
