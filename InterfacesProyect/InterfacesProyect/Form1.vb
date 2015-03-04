Imports MySql.Data.MySqlClient
Public Class Form1

    Private Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Dim Txtservidor As String = "dbalumnos"
        Dim txtusuario As String = "A13DavidTM"
        Dim txtcontrasena As String = ""
        Dim txtpuerto As String = "3312"
        Dim lsbd As String = "A13DavidTM"
        Dim cnn As New MySqlConnection("Server=" & Txtservidor & ";" & _
            "Uid=" & txtusuario & ";" & _
            "Pwd=" & txtcontrasena & ";" & _
            "Port=" & txtpuerto & ";" & _
            "Database=" & lsbd & ";")
        cnn.Open()
        MsgBox(cnn.State)
    End Sub
End Class
