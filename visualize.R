# library(forcats)

plot_mass_r_discmeth <- function(df) {
  
  df %>%
    filter(PLANETDISCMETH != "Transit Timing Variations") %>%
    filter(PLANETDISCMETH != "Microlensing") %>%
    filter(PLANETDISCMETH != "Transit") %>% 
    mutate(PLANETDISCMETH = fct_recode(PLANETDISCMETH,
                                       c("Radial velocity" = "RV"))) %>%

    ggplot() + 
    geom_point(aes(x = R, y = MASS,
                   color = PLANETDISCMETH),
               #color = few_palette("medium_blue"),
               alpha = 0.5) +
    
    scale_x_continuous(trans="log10") + 
    scale_y_continuous(trans="log10") + 
    scale_color_manual(values = c("Imaging" = few_palette("medium_red"),
                                  "Transit" = few_palette("medium_blue"),
                                  "Radial velocity" = few_palette("medium_orange"),
                                  "Timing" = few_palette("medium_green"),
                                  "Microlensing" = few_palette("medium_brown"))) +
    guides(color=guide_legend(title="Discovery Method:")) +
    
    annotate("point", x = 1, y = 1,
             size = 2, color = few_palette("medium_red")) +
    annotate("text",
             x = 1, y = 1, hjust = 1.1, vjust = -0.6,
             label = "Earth") +
    annotate("point", x = 11.21, y = 317.8,
             size = 2, color = few_palette("medium_red")) +
    annotate("text",
            x = 11.21, y = 317.8, hjust = 1.25, vjust = -0.6,
            label = "Jupiter") +

    labs(x="Log(radius)", 
         y="Log(mass)",
         caption= "Data source: exoplanets.org; visualization: Robert Mohr, mohrsignal@gmail.com",
         title = "Mass and radius of exoplanets relative to Earth",
         subtitle = "Note log-log scale") +
    
    theme_minimal() + 
    theme(axis.title.y=element_text(angle=0),
          axis.line = element_line(color=few_palette("light_gray")),
          axis.text.y=element_text(size=12),
          axis.text.x=element_text(size=12),
          axis.title.x = element_text(size=12),
          strip.text = element_text(size=12),
          panel.grid.major = element_line(color="gray90"),
          panel.spacing = unit(1, "lines"),
          legend.text = element_text(size=10),
          legend.position = "right")
}

#exoplanets %>% filter(!is.na(PLANETDISCMETH) & MASS != 0) %>% ggplot() + geom_point(aes(x=DIST,y=MASS,color=PLANETDISCMETH), alpha = 0.5) + scale_x_continuous(trans="log10") + scale_y_continuous(trans = "log10") + theme_minimal()

#exoplanets %>% filter(!is.na(PLANETDISCMETH) & A != 0) %>% ggplot(aes(x=PER,y=A)) + geom_point(color = few_palette("medium_blue"), alpha=0.4) + scale_x_continuous(trans="log10") + scale_y_continuous(trans="log10") + theme_minimal()