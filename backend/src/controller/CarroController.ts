import { getRepository } from 'typeorm'
import { Carro } from '../entity/Carro'
import {Request, Response} from 'express'

export const getCarros = async(request: Request, response: Response) => {
    const carro = await getRepository(Carro).find()
    return response.json(carro)
};

export const getCarro = async(request: Request, response: Response) => {
    const { id } = request.params
    const carro = await getRepository(Carro).findOne(id)
    return response.json(carro)
};

export const saveCarro = async(request: Request, response: Response) => {
    const carro = await getRepository(Carro).save(request.body)
    response.json({message: 'Carro Cadastrado!'})
    return response.json(carro)
};


export const updateCarro = async(request: Request, response: Response) => {
    const { id } = request.params
    const carro = await getRepository(Carro).update(id, request.body)

    if (carro.affected == 1) {
        const carroUpdated = await getRepository(Carro).findOne(id)
        response.json({messsage: 'Carro Atualizado!'})
        return response.json(carroUpdated)
    }

    return response.status(404).json({ message: 'Carro Não Encontrado!' })
}

export const finnishedCarro = async(request: Request, response: Response) => {
    const { id } = request.params
    const carro = await getRepository(Carro).update(id, {
        finished: true
    })

    if (carro.affected == 1) {
        const carroUpdated = await getRepository(Carro).findOne(id)
        return response.json({ message: 'Carro Finalizado' })
    }

    return response.status(404).json({ message: 'Carro Não Encontrado!' })
}

export const removeCarro = async(request: Request, response: Response) => {
    const { id } = request.params
    const carro = await getRepository(Carro).delete(id)

    if (carro.affected == 1) {
        const carroUpdated = await getRepository(Carro).findOne(id)
        return response.json({ message: 'Carro Deletado!' })
    }

    return response.status(404).json({ message: 'Carro Não Encontrado!' })
}