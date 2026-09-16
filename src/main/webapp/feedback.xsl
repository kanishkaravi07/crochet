<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:template match="/">

        <html>

        <head>

            <title>Crochet Product Feedback Summary</title>

            <style>

                body {
                    font-family: Arial;
                    margin: 40px;
                    background-color: #f5f5f5;
                }

                h2 {
                    color: #8b5e3c;
                }

                table {
                    border-collapse: collapse;
                    width: 100%;
                    background-color: white;
                }

                th {
                    background-color: #8b5e3c;
                    color: white;
                }

                th, td {
                    border: 1px solid #ccc;
                    padding: 10px;
                    text-align: left;
                }

                tr:nth-child(even) {
                    background-color: #f2f2f2;
                }

            </style>

        </head>

        <body>

            <h2>Crochet Product Feedback Summary</h2>

            <p>
                Total Feedback:
                <b>
                    <xsl:value-of select="count(feedbacks/feedback)"/>
                </b>
            </p>

            <table>

                <tr>
                    <th>Customer Name</th>
                    <th>Crochet Product</th>
                    <th>Rating</th>
                    <th>Comment</th>
                </tr>

                <xsl:for-each select="feedbacks/feedback">

                    <tr>

                        <td>
                            <xsl:value-of select="name"/>
                        </td>

                        <td>
                            <xsl:value-of select="product"/>
                        </td>

                        <td>
                            <xsl:value-of select="rating"/>
                        </td>

                        <td>
                            <xsl:value-of select="comment"/>
                        </td>

                    </tr>

                </xsl:for-each>

            </table>

        </body>

        </html>

    </xsl:template>

</xsl:stylesheet>