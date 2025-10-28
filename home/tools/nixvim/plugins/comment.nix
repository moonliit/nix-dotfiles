{
  plugins.comment = {
    enable = true;
    lazyLoad = {
      enable = true;
      settings = {
        keys = [
          { __unkeyed-1 = "gc"; }
          { __unkeyed-1 = "gb"; }
        ];
      };
    };

    settings = {
      toggler.line = "<leader>/";
      opleader.line = "<leader>/";
    };
  };
}
