document.addEventListener("DOMContentLoaded", function () {
    const stockSymbolElement = document.querySelector("[data-stock-symbol]");
    const stockPriceElement = document.getElementById("stock-price");

    if (!stockSymbolElement) return;
    
    const stockSymbol = stockSymbolElement.getAttribute("data-stock-symbol");

    async function fetchStockPrice(symbol) {
        const API_KEY = "YQSHIVMRAX3H1L94"; 
        const API_URL = `https://www.alphavantage.co/query?function=GLOBAL_QUOTE&symbol=${symbol}&apikey=${API_KEY}`;

        try {
            let response = await fetch(API_URL);
            if (!response.ok) throw new Error("Network response was not ok");

            let data = await response.json();
            const price = data["Global Quote"]?.["05. price"];

            stockPriceElement.textContent = price 
                ? `$${parseFloat(price).toFixed(2)}`
                : "N/A";
        } catch (error) {
            console.error("Error fetching stock price:", error);
            stockPriceElement.textContent = "Error fetching data";
        }
    }

    if (stockSymbol) fetchStockPrice(stockSymbol);
});
