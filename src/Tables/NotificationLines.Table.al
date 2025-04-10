Table 52193446 "Notification Lines"
{
    DrillDownPageID = "Reallocation Linesx";
    LookupPageID = "Reallocation Linesx";

    fields
    {
        field(1;No;Code[20])
        {
            TableRelation = Notifications;
        }
        field(2;"Line No.";Integer)
        {
            Caption = 'Line No.';
        }
        field(3;Text;Text[150])
        {
        }
    }

    keys
    {
        key(Key1;No,"Line No.")
        {
            Clustered = true;
        }
        
    }

    fieldgroups
    {
    }

    var
        Text001: label 'The maximum Membership fee for Member No %1 if %2';
        Text002: label 'The Member No %1 must increase Share Capital to the minimum shares value required of %2 before attempting transaction code %3';
        Text003: label 'The transaction will result to Member No %1 exceeding the maximum allowed share capital value of %2. To increase the shares, perform the share transfer transaction, otherwise deposit %3 as Share Capital';
        Text004: label 'The Member No %1 does have a product %2';
}

