server <- (function(input, output){
  output$pricefeatures <- renderPlot({
    
    
    
    ggplot(pricefeature, aes_string(x=input$pricefeatures, y=pricefeature$priceformatted, fill=input$pricefeatures) ) +
      geom_boxplot(outlier.shape = NA) + coord_flip() + theme(legend.key.size = unit(0.4, 'cm')) + labs(title= "Features vs Price analysis", y="Price in $", x = "Features", fill = "Features")+ theme(plot.title = element_text(hjust = 0.5), plot.subtitle = element_text(hjust = 0.5), legend.key.size = unit(0.4, 'cm'))
    
  })
  
  output$arrondissementplot <- renderPlot({
    
    Visit_feq_df_grouped <- head(Visit_feq_df_grouped,input$rangedata)
    year_input <- input$year
    arrondissement_input <- c(input$arrondissement)
    
    if(input$arrondissement == "All Arrondissement"){
      visit_df_to_plot <- Visit_feq_df_grouped %>% filter(Year %in% year_input)
      ggplot(visit_df_to_plot, aes(x = month, y = nummonth, group = Year, color = Year, linetype = Year)) +
        geom_line()+ xlab("Month of the year") + ylab("Total visits") +
        facet_wrap(~ arrondissement) + labs(title= "Visit Frecuency Graph") + theme(plot.title = element_text(hjust = 0.5), plot.subtitle = element_text(hjust = 0.5), axis.text.x=element_blank())
    } else{
      visit_df_to_plot <- Visit_feq_df_grouped %>% filter(arrondissement %in% arrondissement_input, Year %in% year_input)
      ggplot(visit_df_to_plot, aes(x = month, y = nummonth, group = Year, color = Year, linetype = Year)) +
        geom_line()+ xlab("Month of the year") + ylab("Total visits") + labs(title= "Visit Frecuency Graph") + theme(plot.title = element_text(hjust = 0.5), plot.subtitle = element_text(hjust = 0.5), axis.text.x=element_blank())
    }
  })
  
  output$hostplot <- renderPlot({
    host_apartment_count$n <- as.numeric(levels(host_apartment_count$n))[host_apartment_count$n]
    df_host_to_plot <- head(df_host_to_plot,input$hostrangedata)
    
    ggplot(df_host_to_plot, aes(x=`host_apartment_count$n`, y=n) ) +
      geom_point(alpha = 2/5) + labs(title= "Number of aparments per host", y="Quantity of Host (Log10)", x = "Quantity of apartment owned", fill = "Legend - Host") + theme(plot.title = element_text(hjust = 0.5), plot.subtitle = element_text(hjust = 0.5), legend.position = "none") + scale_y_continuous(trans = "log10") 
  })
  output$rentingprice <- renderPlot({
    
    if(input$arrondissementprice == "All"){
      ggplot(mean_renting_price, aes(x=arrondissement, y=Renting_Price, fill=arrondissement) ) +
        geom_bar (stat="identity")+theme_minimal() + labs(title= "Renting Price mean per Arrondissement", y="Renting Price", x = "Arrondissement #", fill = "Arrondissement #") + theme(plot.title = element_text(hjust = 0.5), plot.subtitle = element_text(hjust = 0.5), legend.key.size = unit(0.4, 'cm'), legend.position = "none")
    }else{
      mean_renting_price <- mean_renting_price %>% filter(arrondissement %in% input$arrondissementprice)
      ggplot(mean_renting_price, aes(x=arrondissement, y=Renting_Price, fill=arrondissement) ) +
        geom_bar (stat="identity")+theme_minimal() + labs(title= "Renting Price mean per Arrondissement", y="Renting Price", x = "Arrondissement #", fill = "Arrondissement #") + theme(plot.title = element_text(hjust = 0.5), plot.subtitle = element_text(hjust = 0.5), legend.key.size = unit(0.4, 'cm'), legend.position = "none")
    }
  })
})