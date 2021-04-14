
const brands = [
    {
        typeBrand: 'pc',
        bModels: [
            {
                brand: 'Apple',
                models: [
                    'MacBook Pro',
                    'MacBook Air',
                    'Mac Mini',
                    'iMac',
                    'Mac Pro'

                ]
            },
            {
                brand: 'Dell',
                models: [
                    'Inspiron',
                    'XPS',
                    'Alienware',
                    'G',
                    'Latitude',
                    'Optiplex'

                ]
            },
            {
                brand: 'Lenovo',
                models: [
                    'Ideapad',
                    'Yoga',
                    'Legion',
                    'Thinkpad'

                ]
            },
            {
                brand: 'Hp',
                models: [
                    'Spectre',
                    'ENVY',
                    'Pavilion',
                    'Pro',
                    'Elite',
                    'Zbook'

                ]
            },
            {
                brand: 'Asus',
                models: [
                    'TUF',
                    'FLIP',
                    'VivoBook'
                ]
            },
            {
                brand: 'Acer',
                models: [
                    'Aspire',
                    'Chrombook',
                    'Nitro'
                ]
            },
            {
                brand: 'Razer',
                models: [
                    'Blade 15',
                    'Blade Pro',
                    'Blade Base',
                    'Blade Advanced',
                    'Blade Studio'
                ]
            },
            {
                brand: 'Microsoft',
                models: [
                    'Surface 3',
                    'Surface 7',
                    'Surface Book 3',
                    'Surface Pro'
                ]
            },
            {
                brand: 'MSI',
                models: [
                    'GT Titan',
                    'GS Stealth',
                    'GE Raider',
                    'GP Leopard',
                    'GF Thin'
                ]
            },
            {
                brand: 'Samsung',
                models: [
                    'Notebook 9 Pro',
                    'Notebook Flash',
                    'Chromebook',
                    'Notebook 5',
                    'Chromebook Plus',
                    'Notebook 7'
                ]
            },
            {
                brand: 'Toshiba',
                models: [
                    'Dynabook',
                    'Satelite',
                    'Portege',
                    'Chromebook'
                ]
            },
            {
                brand: 'Sony',
                models: [
                    'Vaio vgn',
                    'Vaio pcg'
                ]
            },
            {
                brand: 'Google',
                models: [
                    'Lenovo Chromebook',
                    'Samsung Chromeook',
                    'Pixelbook',
                    'Acer Chromebook'
                ]
            }
        ]
    },
    {

        typeBrand: 'cpu',
        bModels: [
            {
                brand: 'Intel',
                models: [
                    'Core X',
                    'Core i9',
                    'Core i7',
                    'Core i5',
                    'Core i3',
                    'Xeon',
                    'Pentium',
                    'Celeron',
                    'Atom'
                ]
            },
            {
                brand: 'AMD',
                models: [
                    'Ryzen 3',
                    'Ryzen 5',
                    'Ryzen 7',
                    'Ryzen 9',
                    'Ryzen Threadripper',
                ]
            }
        ]
    }



]

const storagePC = [
    {
        typeStorage:'HDD',
        capacity: [
            '160 GB',
            '250 GB',
            '320 GB',
            '500 GB',
            '1 TB',
            '1.5 TB',
            '2 TB'

        ]
    },
    {
        typeStorage: 'SSD',
        capacity: [
            '128 GB',
            '256 GB',
            '512 GB',
            '1 TB',
            '2 TB',
            '3 TB'

        ]
    }
]


const ram = [
    '4 GB',
    '8 GB',
    '16 GB',
    '32 GB',
    '64 GB'
]
const panel = ['13 pulg', '14 pulg', '15 pulg', '16 pulg', '17 pulg']

const graphicCard = [
    'Integrated',
    'GIGABYTE GEFORCE GTX 1660',
    'GIGABYTE GEFORCE RTX 2070',
    'MSI Radeon RX 570 Armor',
    'Sapphire Radeon RX 580 Nitro Plus',
    'GIGABYTE GEFORCE RTX 2080 SUPER WINDFORCE',
    'MSI GeForce GTX 1050 Ti Gaming X 4G',
    'MSI GeForce GTX 1060 Gaming X 3G',
    'Nvidia Geforce RTX 3080'
]

module.exports = {
    brands,
    storagePC,
    ram,
    panel,
    graphicCard
}