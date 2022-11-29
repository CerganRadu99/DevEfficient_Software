using Domain.Dtos;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace Application.Interfaces
{
    public interface ISprintService
    {
        public Task<Guid> RegisterSprint(RegisteredSprintDto registeredSprintDto);
        public Task<int> ActivateSprint(RegisteredSprintDto registeredSprintDto);
        public Task<RetrievedCurrentSprint> GetCurrentActivatedSprint();
        public Task<int> CloseCurrentActivatedSprint();
        public List<RetrievedItemDto> GetCurrentSprintItems();

        public Task<int> DeleteCurrentSprint();
    }
}
