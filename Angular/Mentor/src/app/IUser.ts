export interface IUser
{
    userId?:bigint;
email:string;
pass:string;
firstName:string;
lastName:string;
contact:number;
regDatetime:Date;
regCode?:number;
forcedResetPassword?:string;
active?:boolean;
}
