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



