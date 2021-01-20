import { getMessage } from './message';
import express, { query } from 'express';

export class RootController {
    private _router = express.Router();

    constructor() {
        this._router.get('/', this.get);
    }

    public get path() {
        return '/'
    }

    public get router() {
        return this._router;
    }

    private get = (req: express.Request, res: express.Response) => {
        res.send(getMessage());
    }
}