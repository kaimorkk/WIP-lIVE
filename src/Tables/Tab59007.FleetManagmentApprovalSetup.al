
table 59007 "Fleet Managment Approval Setup"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; UserID; Code[20])
        {
            TableRelation = User;
        }
        field(2; "Fleet Management Area"; Option)
        {
            OptionMembers = " ","Vehicle Management",TransportReq,DailyWorksheet,FuelReq,MaintenanceReq;
        }
        field(3; Create; Boolean)
        {
        }
        field(4; "Line Manager Approver"; Boolean)
        {
        }
        field(5; "Transport Mger Approver"; Boolean)
        {
        }
        field(6; "View Only Department"; Boolean)
        {
        }
        field(7; "User Department"; Code[20])
        {
        }
    }

    keys
    {
        key(Key1; UserID)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

