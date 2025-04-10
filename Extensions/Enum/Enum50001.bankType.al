namespace ALProjectLIWPA.ALProjectLIWPA;


enum 50001 BankType
{
    Extensible = true;

    value(0; Bank)
    {
        Caption = 'Bank';
    }
    value(1; "Petty Cash")
    {
        Caption = 'Petty Cash';
    }
    value(2; Revenue)
    {
        Caption = 'Revenue';
    }
    value(3; Deposit)
    {
        Caption = 'Deposit';
    }
    value(4; Recurrent)
    {
        Caption = 'Recurrent';
    }
    value(5; Development)
    {
        Caption = 'Development';
    }
}