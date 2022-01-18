using Domain.Dtos;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace Application.Interfaces
{
    public interface ISprintService
    {
        public Task<int> RegisterSprint(RegisteredSprintDto registeredSprintDto);
    }
}
