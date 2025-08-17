{ config, pkgs, ... }:

{
  programs.starship = {
    enable = true;

    settings = {
      format = ''
        [](#fbee78)\
        $os\
        $username\
        [](fg:#fbee78 bg:#FFFFFF)\
        $directory\
        [](fg:#FFFFFF bg:#9C59D1)\
        $git_branch\
        $git_status\
        [](fg:#9C59D1 bg:#2C2C2C)\
        $c\
        $cmake\
        $custom\
        $python\
        $elixir\
        $elm\
        $golang\
        $gradle\
        $haskell\
        $java\
        $julia\
        $nodejs\
        $nim\
        $rust\
        $scala\
        [](fg:#2C2C2C)\
        $docker_context 
      '';

      # username
      username = {
        show_always = true;
        style_user = "fg:#000000 bg:#fbee78";
        style_root = "fg:#000000 bg:#fbee78";
        format = "[$user ]($style)";
        disabled = false;
      };

      os = {
        style = "bg:#fbee78";
        disabled = true;
      };

      directory = {
        style = "fg:#000000 bg:#ffffff";
        format = "[ $path ]($style)";
        truncation_length = 3;
        truncation_symbol = "…/";
        substitutions = {
          "Desktop" = "";
          "Documents" = "󰈙";
          "Downloads" = "";
          "Music" = "";
          "Pictures" = "";
        };
      };

      c = {
        symbol = " ";
        style = "bg:#2C2C2C";
        format = "[ $symbol ($version) ]($style)";
      };

      cmake = {
        symbol = " ";
        style = "bg:#2C2C2C";
        format = "[ $symbol ($version) ]($style)";
      };

      custom.cpp = {
        detect_extensions = [ "cpp" "cc" "hpp" ];
        command = "find src -type f \\( -name '*.cpp' -o -name '*.cc' -o -name '*.hpp' \\) | head -n 1";
        when = "find src -type f \\( -name '*.cpp' -o -name '*.cc' -o -name '*.hpp' \\) | grep .";
        symbol = "";
        style = "bg:#2C2C2C";
        format = "[ $symbol c++20 ]($style)";
      };

      python = {
        symbol = " ";
        style = "bg:#2C2C2C";
        format = "[ $symbol ($version) ]($style)";
      };

      docker_context = {
        symbol = " ";
        style = "bg:#06969A";
        format = "[ $symbol $context ]($style)";
      };

      elixir = {
        symbol = " ";
        style = "bg:#2C2C2C";
        format = "[ $symbol ($version) ]($style)";
      };

      elm = {
        symbol = " ";
        style = "bg:#2C2C2C";
        format = "[ $symbol ($version) ]($style)";
      };

      git_branch = {
        symbol = "";
        style = "bg:#9C59D1";
        format = "[ $symbol $branch ]($style)";
      };

      git_status = {
        style = "bg:#9C59D1";
        format = "[$all_status$ahead_behind ]($style)";
      };

      golang = {
        symbol = " ";
        style = "bg:#2C2C2C";
        format = "[ $symbol ($version) ]($style)";
      };

      gradle = {
        style = "bg:#2C2C2C";
        format = "[ $symbol ($version) ]($style)";
      };

      haskell = {
        symbol = " ";
        style = "bg:#2C2C2C";
        format = "[ $symbol ($version) ]($style)";
      };

      java = {
        symbol = " ";
        style = "bg:#2C2C2C";
        format = "[ $symbol ($version) ]($style)";
      };

      julia = {
        symbol = " ";
        style = "bg:#2C2C2C";
        format = "[ $symbol ($version) ]($style)";
      };

      nodejs = {
        symbol = "";
        style = "bg:#2C2C2C";
        format = "[ $symbol ($version) ]($style)";
      };

      nim = {
        symbol = "󰆥 ";
        style = "bg:#2C2C2C";
        format = "[ $symbol ($version) ]($style)";
      };

      rust = {
        symbol = "";
        style = "bg:#2C2C2C";
        format = "[ $symbol ($version) ]($style)";
      };

      scala = {
        symbol = " ";
        style = "bg:#2C2C2C";
        format = "[ $symbol ($version) ]($style)";
      };
    };
  };
}

