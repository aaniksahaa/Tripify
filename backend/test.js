
const getCityIDfromName = async(city_name) => {
    return 1
}

const getIds = async () => {
    queries = {
        city_names: [ 'Sylhet', 'Barishal' ],
        hotel: {
        min_price: '',
        max_price: '6000',
        has_parking: '1',
        has_wifi: '',
        has_gym: '1'
        },
        restaurant: { min_price: '100', max_price: '600' }
    }

    city_ids = []
    for(let city_name of queries.city_names)
    {
        console.log(city_name)
        const id = await getCityIDfromName(city_name)
        city_ids.push(id)
    }

    const city_id_str = city_ids.join(',')

    console.log(city_id_str)

}

getIds()