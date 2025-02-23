<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    
    <xsl:output method="html" encoding="UTF-8" indent="yes"/>

    <xsl:template match="/">
        <html>
            <head>
                <title>Recibo de Compra - Moda Express</title>
                <style>
                body {
                    font-family: 'Arial', sans-serif;
                    background-color: #1e1e1e;
                    color: #e0e0e0;
                    padding: 20px;
                }
                .container {
                    max-width: 700px;
                    margin: auto;
                    background: #2a2a2a;
                    padding: 20px;
                    border-radius: 10px;
                    box-shadow: 0 2px 10px rgba(0, 0, 0, 0.5);
                }
                h2 {
                    text-align: center;
                    color:rgb(0, 255, 136);
                }
                table {
                    width: 100%;
                    border-collapse: collapse;
                    margin-top: 20px;
                }
                th, td {
                    border: 1px solid #666;
                    padding: 10px;
                    text-align: left;
                }
                th {
                    background: #3a3a3a;
                }
                .total {
                    font-weight: bold;
                    color: rgb(0, 255, 136);
                }
                </style>

            </head>
            <body>
                <div class="container">
                    <h2>Recibo de Compra</h2>
                    <table>
                        <tr>
                            <th>Fecha</th>
                            <td><xsl:value-of select="//InvoiceIssueDate"/></td>
                        </tr>
                        <tr>
                            <th>Cliente</th>
                            <td><xsl:value-of select="//BuyerParty/PartyName/Name"/></td>
                        </tr>
                        <tr>
                            <th>Total</th>
                            <td class="total"><xsl:value-of select="//InvoiceTotalAmount"/> €</td>
                        </tr>
                    </table>
                    <h3>Resumen de la Compra</h3>
                    <table>
                        <tr>
                            <th>Artículo</th>
                            <th>Talla</th>
                            <th>Color</th>
                            <th>Cantidad</th>
                            <th>Precio Unitario</th>
                            <th>Total</th>
                        </tr>
                        <xsl:for-each select="//Items/InvoiceLine">
                            <tr>
                                <td><xsl:value-of select="ItemDescription"/></td>
                                <td><xsl:value-of select="Size"/></td>
                                <td><xsl:value-of select="Color"/></td>
                                <td><xsl:value-of select="Quantity"/></td>
                                <td><xsl:value-of select="UnitPriceWithoutTax"/> €</td>
                                <td><xsl:value-of select="TotalCost"/> €</td>
                            </tr>
                        </xsl:for-each>
                    </table>
                </div>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
