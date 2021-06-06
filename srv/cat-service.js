module.exports = (srv) => {

    // Reply mock data for Books...
    srv.on ('Create', 'Products', async(req)=>{
        console.log("Hi");
    })
   
    // // Reply mock data for Authors...
    // srv.on ('READ', 'Chefs', ()=>[
    //   { ID:101, name:'Emily Brontë' },
    //   { ID:150, name:'Edgar Allen Poe' },
    //   { ID:170, name:'Richard Carpenter' },
    // ])
   
   }