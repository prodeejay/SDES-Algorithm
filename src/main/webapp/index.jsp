<%--
  Created by IntelliJ IDEA.
  User: ZOOBAZIZ
  Date: 21-04-2017
  Time: 07:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@include file="algorithm.jsp"%>

<html>
  <head>
    <title>SDES ALGORITHM</title>
  </head>
  <body>
    <h1 align="center">SDES ENCRYPTION ALGORITHM</h1>
    <%! int state1, state2; %>
    <table align="center">
        <tr>
            <th colspan="2">ENCRYPTION</th>
            <th colspan="2">DECRYPTION</th>
        </tr>
        <tr>
            <td colspan="2">
                <div align="center">
                    <%
                        state1 = 0;
                        String p1 = request.getParameter("state1");
                        if(p1 != null)
                            state1 = Integer.parseInt(p1);
                        switch (state1)
                        {
                            case 0: {
                    %>
                    <form>
                        <p>Enter 8 bit plaintext : (Ex Plaintext : 10001010) </p>
                        <br />
                        <input type="text" required="required" name="plaintext"/>
                        <br />
                        <p>Enter 10 bit Key: (Ex Key : 1010101010) </p>
                        <br />
                        <input type="text" required="required" name="key"/>
                        <br />
                        <button type="submit" name="encrypt" onclick="submit()">ENCRYPT</button>
                        <input type="hidden" value="1" name="state1">
                    </form>
                    <%
                        break;
                        }
                        case 1: {
                            String plaintext = request.getParameter("plaintext");
                            String key = request.getParameter("key");
                            Encryption_algo sdes = new Encryption_algo();
                            int[] ciphertext = sdes.encrypt(plaintext, key);
                    %>
                    <form>
                        <p>
                            <b> Ciphertext </b>
                            <br />
                            <i>
                                <%
                                    for(int i=0; i<8; i++)
                                        out.print(ciphertext[i]);
                                %>
                            </i>
                        </p>
                        <button type="submit" name="encrypt" onclick="submit()"> Go Back </button>
                        <input type="hidden" value="0" name="state1">
                    </form>
                    <%
                        break;
                        }
                    }
                    %>
                </div>
            </td>

            <td colspan="2">
                <div align="center">
                    <%
                    state2 = 0;
                    String p2 = request.getParameter("state2");
                    if(p2 != null)
                        state2 = Integer.parseInt(p2);
                    switch (state2)
                    {
                        case 0: {
                    %>
                    <form>
                        <p>Enter 8 bit ciphertext : (EX Ciphertext : 00000011) </p>
                        <br />
                        <input type="text" required="required" name="ciphertext"/>
                        <br />
                        <p>Enter 10 bit Key: (Ex Key : 1010101010)</p>
                        <br />
                        <input type="text" required="required" name="key"/>
                        <br />
                        <button type="submit" value="1" name="decrypt" onclick="submit()">DECRYPT</button>
                        <input type="hidden" value="1" name="state2">
                    </form>
                    <%
                            break;
                        }
                        case 1: {
                            String ciphertext1 = request.getParameter("ciphertext");
                            String key = request.getParameter("key");
                            Decryption_algo sdes = new Decryption_algo();
                            int[] ciphertext = sdes.decrypt(ciphertext1, key);
                    %>
                    <form>
                        <p>
                            <b> Plaintext </b>
                            <br />
                            <i>
                                <%
                                    for(int i=0; i<8; i++)
                                        out.print(ciphertext[i]);
                                %>
                            </i>
                        </p>
                        <button type="submit" name="decrypt" onclick="submit()"> Go Back </button>
                        <input type="hidden" value="0" name="state2">
                    </form>
                    <%
                        break;
                    }
                    }
                    %>

                </div>
            </td>
        </tr>
    </table>
  </body>
</html>