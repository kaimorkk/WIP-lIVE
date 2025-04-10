page 50421 "Submitted Inspections"
{
    Caption = 'Submitted Inspections';

    CardPageID = "Inspection Header";
    DeleteAllowed = false;
    Editable = false;
    PageType = List;
    SourceTable = "Inspection Header1";
    //SourceTableView = where(Status = filter(Submitted));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(InspectionNo; "Inspection No")
                {
                    ApplicationArea = Basic;
                }
                field(OrderNo; "Order No")
                {
                    ApplicationArea = Basic;
                }
                field(CommiteeAppointmentNo; "Commitee Appointment No")
                {
                    ApplicationArea = Basic;
                }
                field(InspectionDate; "Inspection Date")
                {
                    ApplicationArea = Basic;
                }
                field(SupplierName; "Supplier Name")
                {
                    ApplicationArea = Basic;
                }
                field(NoSeries; "No. Series")
                {
                    ApplicationArea = Basic;
                }
                field(Status; Status)
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
    }
}

