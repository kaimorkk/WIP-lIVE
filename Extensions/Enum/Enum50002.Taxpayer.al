enum 50026 "Taxpayer Type"
{
    Extensible = true;

    value(0; " ")
    {
        Caption = '';
    }
    value(1; COMP)
    {
        Caption = 'Non-Individual Company';
    }
    value(2; KE)
    {
        Caption = 'Individual - Kenyan Citizen';
    }
    value(3; NKE)
    {
        Caption = 'Individual Non-Kenyan Resident';
    }
    value(4; SPB)
    {
        Caption = 'Sole Proprietorship';
    }
    value(5; NKENR)
    {
        Caption = 'Individual - Non Kenyan Non-Resident';
    }
}
