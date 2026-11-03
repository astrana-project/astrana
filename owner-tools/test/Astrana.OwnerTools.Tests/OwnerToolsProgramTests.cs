// SPDX-License-Identifier: MPL-2.0

using System.Reflection;
using Xunit;

namespace Astrana.OwnerTools.Tests;

public sealed class OwnerToolsProgramTests
{
    [Fact]
    public void OwnerToolsIsAProgramThatCanBeRun()
    {
        var ownerTools = Assembly.Load("Astrana.OwnerTools");

        Assert.NotNull(ownerTools.EntryPoint);
    }
}
