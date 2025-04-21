#ifndef REGISTRATIONS_HPP
#define REGISTRATIONS_HPP
#ifdef EMSCRIPTEN

// Workspaces
namespace Mantid { 
  namespace DataObjects {
    void register_ws_Workspace2D();
    void register_ws_MaskWorkspace();
    void register_ws_EventWorkspace();
    void register_ws_PeaksWorkspace();
    void register_ws_RebinnedOutput();
    void register_ws_TableWorkspace();
    void register_ws_GroupingWorkspace();
    void register_ws_SpecialWorkspace2D();
    void register_ws_WorkspaceSingleValue();
    void register_ws_LeanElasticPeaksWorkspace();
  } 
}

#endif // EMSCRIPTEN
#endif // REGISTRATIONS_HPP
