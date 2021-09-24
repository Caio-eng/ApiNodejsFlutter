import { Router, Request, Response, request } from "express"

import { getCarros, saveCarro, getCarro, updateCarro, finnishedCarro, removeCarro } from './controller/CarroController'

const routes = Router()

routes.get('/', (request: Request, response: Response) => {
    return response.json({ message: 'Hello Word' })
})

routes.get('/carro', getCarros)
routes.get('/carro/:id', getCarro)
routes.post('/carro', saveCarro)
routes.put('/carro/:id', updateCarro)
routes.patch('/carro/:id', finnishedCarro)
routes.delete('/carro/:id', removeCarro)

export default routes