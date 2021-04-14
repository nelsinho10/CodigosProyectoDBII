<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Captura de Big Data</title>
    <style>
        .float{
            display: flex;
        }
        #country-form{
            width: 50%;
        }
        #currency-form{
            width: 50%;
        }
        #currency{
            margin-left: 1px;
            width: 66%;
            border: 1px solid black;
        }
        div{
            text-align: center;
        }
        #country{
            width: 33%;
            border: 1px solid black;
        }

        table {
            border-collapse: collapse;
            width: 100%;
        }
        th, td {
            padding: 0.25rem;
            text-align: left;
            border: 1px solid #ccc;
        }
        tbody tr:hover {
            background: #ffe3af;
        }
    </style>
</head>
<body>
    <div id="titulo">
        <h1>Captura de Big Data</h1>
    </div>
    <hr>
    <div class="float">
        <div id="country-form">
            <form action="populateCountry" method="post">
                @csrf
                <button type="submit">Populate Countries Table</button>
            </form>
        </div>
        <hr>
        <div id="currency-form">
            <form action="populateCurrency" method="post">
                @csrf
                <label for="from">From: </label>
                <input type="date" name="from" id="from" min="2015-01-01" max="{{ date('Y-m-d') }}" required><br>
                <label for="to">To: </label>
                <input type="date" name="to" id="to" min="2015-01-01" max="{{ date('Y-m-d') }}" required><br>
                <button type="submit">Populate Currencies Table</button>
            </form>            
        </div>
    </div>
    <hr>
    <div class="float">
        <div id="country">
            <h2>Countries</h2>
            <table>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                </tr>
                @foreach ($data[0] as $item)
                    <tr>
                        <td>{{ $item->id }}</td>
                        <td>{{ $item->name }}</td>
                    </tr>  
                @endforeach
            </table>
        </div>
        
        <div id="currency">
            <h2>Currencies</h2>
            <table>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Value</th>
                    <th>Date</th>
                </tr>
                @foreach ($data[1] as $item)
                    <tr>
                        <td>{{ $item->id }}</td>
                        <td>{{ $item->name }}</td>
                        <td>{{ $item->value }}</td>
                        <td>{{ $item->date }}</td>
                    </tr>  
                @endforeach
            </table>
        </div>
    </div>

</body>