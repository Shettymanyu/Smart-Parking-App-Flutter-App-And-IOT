import playwright
from datetime import datetime

async def select_dates():
    # Initialize Playwright
    playwright = await playwright.async_init()
    browser = await playwright.chromium.launch()
    page = await browser.newPage()

    # Navigate to your web application's URL
    await page.goto("https://your_web_app_url")

    # Assuming the start date input has an ID "StartDateInput"
    # and the end date input has an ID "EndDateInput"
    # Adjust these IDs according to your actual HTML structure

    # Get the current date
    today = datetime.today().strftime('%m/%d/%Y')

    # Get the first day of the current month
    first_day_of_month = datetime.today().replace(day=1).strftime('%m/%d/%Y')

    # Locate the start date input field and click it
    start_date_input = await page.locator("#StartDateInput")
    await start_date_input.click()

    # Clear the existing value in the start date input
    await start_date_input.fill("")

    # Type the first day of the month
    await start_date_input.type(first_day_of_month)

    # Locate the end date input field and click it
    end_date_input = await page.locator("#EndDateInput")
    await end_date_input.click()

    # Clear the existing value in the end date input
    await end_date_input.fill("")

    # Type today's date
    await end_date_input.type(today)

    # Close the browser
    await browser.close()

# Run the script
asyncio.run(select_dates())


import pyautogui
import time

def trigger_volume_box():
    # Simulate pressing the volume up and down keys to trigger the volume box
    pyautogui.press('volumeup')
    pyautogui.press('volumedown')

def main(delay_seconds=1, num_loops=None):
    print("Triggering volume box in a loop.")
    print("Press Ctrl+C to stop.")

    loop_count = 0
    while True:
        trigger_volume_box()
        time.sleep(delay_seconds)

        if num_loops is not None and loop_count >= num_loops:
            break

        loop_count += 1

if __name__ == "__main__":
    # Run the loop indefinitely with a 1-second delay between each iteration
    main(delay_seconds=1)
    # Run the loop for 5 iterations with a 2-second delay between each iteration
    # main(delay_seconds=2, num_loops=5)
    
    
    
    
    
    
    
    
    
    
    
    
    
    

import playwright
from playwright.sync_api import Playwright, Page, Browser

def read_email(email_content):
    # Parse the email content to extract the transaction ID
    # ... (implementation depends on email format and library used)
    transaction_id = extract_transaction_id(email_content)
    return transaction_id

def check_payment_status(page, transaction_id):
    # Navigate to the website
    page.goto("https://your_payment_website")

    # Find and input the transaction ID into the search bar
    search_bar = page.locator("#transaction_id_input")
    search_bar.fill(transaction_id)

    # Submit the search
    search_button = page.locator("#search_button")
    search_button.click()

    # Wait for the payment status to load
    page.wait_for_timeout(5000)

    # Extract the payment status from the website's response
    payment_status_element = page.locator("#payment_status")
    payment_status = payment_status_element.inner_text()

    return payment_status

def main():
    # Replace with your email reading logic
    email_content = get_email_content()

    transaction_id = read_email(email_content)

    with playwright.sync_api.Playwright() as p:
        browser = p.chromium.launch(headless=False)
        page = browser.new_page()
        
        payment_status = check_payment_status(page, transaction_id)

        print(f"Payment status for transaction ID {transaction_id}: {payment_status}")

        browser.close()

if __name__ == "__main__":
    main()



