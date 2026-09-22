package com.crochet.servlet;

import java.util.List;

import org.openqa.selenium.Alert;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.firefox.FirefoxDriver;



public class CrochetWorldSeleniumTest {

    public static void main(String[] args) throws InterruptedException {

        // a) BASICS

    	WebDriver driver = new FirefoxDriver();

        // To launch Firefox instead, use:
        // WebDriverManager.firefoxdriver().setup();
        // WebDriver driver = new FirefoxDriver();

        driver.manage().window().maximize();

        // Open website
        driver.get("http://localhost:8080/kani_demo/");
       

        System.out.println("Home page opened");

        // Wait for 3 seconds
        Thread.sleep(3000);


        // Capture URL
        System.out.println("Current URL: " + driver.getCurrentUrl());

        // Capture page title
        System.out.println("Page Title: " + driver.getTitle());

        // Capture page source
        System.out.println("Page Source:");
        System.out.println(driver.getPageSource());

        // Refresh page
        driver.navigate().refresh();

        // Navigate to another page
        driver.navigate().to("http://localhost:8080/kani_demo/feedback.jsp");

        // Navigate back
        driver.navigate().back();

        // Navigate forward
        driver.navigate().forward();

        Thread.sleep(2000);

        // b) WEB ELEMENTS

        // Open feedback page
        driver.get("http://localhost:8080/kani_demo/feedback.jsp");

        // Find element using ID
        WebElement nameField = driver.findElement(By.id("name"));

        // isDisplayed()
        System.out.println("Name field displayed: "
                + nameField.isDisplayed());

        // isEnabled()
        System.out.println("Name field enabled: "
                + nameField.isEnabled());

        // clear()
        nameField.clear();

        // sendKeys()
        nameField.sendKeys("Kanishka");

        // Find product field using name
        WebElement productField =
                driver.findElement(By.name("product"));

        productField.clear();
        productField.sendKeys("Crochet Bag");

        // Find rating element
        WebElement ratingField =
                driver.findElement(By.id("rating"));

        // isSelected()
        System.out.println("Rating selected: "
                + ratingField.isSelected());

        // Find comment field
        WebElement commentField =
                driver.findElement(By.id("comment"));

        commentField.sendKeys("Beautiful crochet product");

        // click()
        // Use this only if you want to submit the form
        // WebElement submitButton =
        //         driver.findElement(By.cssSelector("input[type='submit']"));
        // submitButton.click();

        // getAttribute()
        System.out.println("Name field type: "
                + nameField.getAttribute("type"));

        // getText()
        System.out.println("Page text:");
        System.out.println(driver.findElement(By.tagName("body")).getText());

        // findElements()
        List<WebElement> allLinks =
                driver.findElements(By.tagName("a"));

        System.out.println("Number of links: " + allLinks.size());

        for (WebElement link : allLinks) {
            System.out.println("Link text: " + link.getText());
        }

        // c) LOCATING ELEMENTS

        // 1. Locate by ID
        driver.findElement(By.id("name"));

        // 2. Locate by name
        driver.findElement(By.name("product"));

        // 3. Locate by class name
        List<WebElement> elementsByClass =
                driver.findElements(By.className("form-control"));

        System.out.println("Elements by class: "
                + elementsByClass.size());

        // 4. Locate by link text
        List<WebElement> links =
                driver.findElements(By.linkText("Home"));

        System.out.println("Home links found: " + links.size());

        // 5. Locate by tag name
        List<WebElement> inputElements =
                driver.findElements(By.tagName("input"));

        System.out.println("Input elements: "
                + inputElements.size());

        // 6. Locate by CSS selector
        List<WebElement> cssElements =
                driver.findElements(By.cssSelector("input"));

        System.out.println("CSS elements: "
                + cssElements.size());

        // 7. Locate by XPath
        WebElement nameUsingXPath =
                driver.findElement(By.xpath("//input[@id='name']"));

        System.out.println("XPath element displayed: "
                + nameUsingXPath.isDisplayed());

        // SwitchTo example: switch to an alert
        // This works only if an alert is currently open.
        //
        // Alert alert = driver.switchTo().alert();
        // System.out.println(alert.getText());
        // alert.accept();

        // Close browser
        System.out.println("Feedback form filled successfully.");

        Thread.sleep(10000); // Browser stays open for 10 seconds

        driver.quit();
    }
}
