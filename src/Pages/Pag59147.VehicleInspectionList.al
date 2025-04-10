

page 52194181 "Vehicle Inspection List"
{
    CardPageID = "Vehicle Inspection Card";
    PageType = List;
    SourceTable = "Vehicle Inspection";
    SourceTableView = where(Posted = const(false));


    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Inspection No."; Rec."Inspection No.")
                {
                    ApplicationArea = Basic;
                }
                field("Registration No."; Rec."Registration No.")
                {
                    ApplicationArea = Basic;
                }
                field(Type; Rec.Type)
                {
                    ApplicationArea = Basic;
                }
                field(Make; Rec.Make)
                {
                    ApplicationArea = Basic;
                }
                field(Model; Rec.Model)
                {
                    ApplicationArea = Basic;
                }
                field("Inspection Date"; Rec."Inspection Date")
                {
                    ApplicationArea = Basic;
                }
                field("Inspection Center"; Rec."Inspection Center")
                {
                    ApplicationArea = Basic;
                }
                field(Amount; Rec.Amount)
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

#pragma implicitwith restore

