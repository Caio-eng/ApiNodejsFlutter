import { Column, CreateDateColumn, Entity, PrimaryGeneratedColumn, UpdateDateColumn } from 'typeorm'

@Entity()
export class Carro {

    @PrimaryGeneratedColumn()
    id: number;

    @Column()
    nome: String;

    @Column()
    marca: string;

    @Column()
    modelo: string;

    @Column({default: false})
    finished: boolean;

    @CreateDateColumn()
    created_at: Date;

    @UpdateDateColumn()
    updated_at: Date;

}