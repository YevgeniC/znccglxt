<%@ page contentType="text/html;charset=gb2312" %>
<HTML>
<head>
    <title></title>
    <style type="text/css">
        *{
            margin: 0;
            padding: 0;
        }
        table{
            border:0; 
            text-align: center;
            font-size: 13px;
        }
        #body{
            margin: 8px; 
            width: 700px;
            height: 524px;
            background-color: #FFF;
           
        }
        #table{
            width: 500px;
            /*height: 190px;*/
            text-align: center;
            position: relative;
            top: 70px;
            /*opacity: 0;*/
            /*transition: 1s;*/
            /*border: 1px solid #CCC;*/
            table-layout:fixed; 
        }
        #table tr td{
            width: 85px;
            height: 60px;
            border-bottom: 1px solid #CCC;
            word-wrap:break-word;
        }
        #table input{
            margin: 0;
            padding: 0;
            width: 120px;
            height: 50px;
        }
        
    </style>
</head>
<body>
    <div id="body"> 
        <form action="../../Insert" method="post">
            名称<input type="text" name="goods_name" style="border: 1" contenteditable="true">
                    编号<input type="text" name="goods_no" style="border: 1" contenteditable="true">
                    仓库编号<input type="text" name="goods_spec" style="border: 1" contenteditable="true">
                    数量<input type="text" name="goods_sum" style="border: 1" contenteditable="true">
                    类型<input type="text" name="goods_type" style="border: 1;width: 225px;" contenteditable="true">
            <input type="submit" value="新建入库单" style="width: 120px;height: 40px;line-height: 40px;text-align: center;background-color: #28D5B7;border:0;border-radius: 5px;color: #FFF;margin:100px 75px 0 75px;cursor: pointer;">
        </form>
    </div>
    <script type="text/javascript">
        // function  sure(){
        //     window.location='entryshow.jsp';
        // }
        function clo(){
            window.location='entryshow.jsp';
        }
    </script>
</body>
</HTML>