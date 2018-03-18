/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package hust.sie.inpg12.sonnc.systemauto;

import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

/**
 *
 * @author sonnc
 */
public class Action implements ServletContextListener {
 
    private ScheduledExecutorService scheduler;
 
    @Override
    public void contextInitialized(ServletContextEvent event) {
//        scheduler = Executors.newSingleThreadScheduledExecutor();
//        Runnable command = new Controller(event.getServletContext());
//        // Delay 1 Minute to first execution
//        long initialDelay = 1;
//        TimeUnit unit = TimeUnit.MINUTES;
//        // period the period between successive executions
//        long period = 1;// 60 Minute!
// 
//        scheduler.scheduleAtFixedRate(command, initialDelay, period, unit);
    }
 
    @Override
    public void contextDestroyed(ServletContextEvent event) {
        scheduler.shutdownNow();
    }
}

