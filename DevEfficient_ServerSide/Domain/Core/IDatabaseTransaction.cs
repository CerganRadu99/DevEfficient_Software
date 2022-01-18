using System;
using System.Collections.Generic;
using System.Text;

namespace Domain.Core
{
    public interface IDatabaseTransaction : IDisposable
    {
        void Commit();
        void Rollback();
    }
}
