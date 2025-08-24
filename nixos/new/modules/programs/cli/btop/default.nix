{ config, pkgs, ... }:

{
  programs.btop = {
    enable = true;
    settings = {
      color_theme = "catppuccin-mocha";
      theme_background = false;
      rounded_corners = true;
      proc_sorting = "memory";
      proc_reversed = true;
      proc_per_core = true;
      proc_colors = true;
      proc_gradient = true;
      proc_mem_bytes = true;
      proc_cpu_graphs = true;
      proc_info_smaps = false;
      proc_left = false;
      proc_filter_kernel = false;
      check_temp = true;
      cpu_sensor = "Auto";
      show_uptime = true;
      clock_format = "%X";
      background_update = true;
      disks_filter = "";
      mem_graphs = true;
      net_download = 100;
      net_upload = 100;
      net_auto = true;
      net_sync = true;
      net_iface = "";
      show_battery = true;
      selected_battery = "Auto";
      log_level = "WARNING";
    };
  };
} 
