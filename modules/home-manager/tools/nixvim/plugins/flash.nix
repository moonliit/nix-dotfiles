{
  plugins.flash = {
    enable = true;
    lazyLoad = {
      enable = true;
      settings = {
        keys = [
          { __unkeyed-1 = "s"; }
          { __unkeyed-1 = "S"; }
        ];
      };
    };

    settings = {
      modes.char.enabled = false;
    };
  };
}
