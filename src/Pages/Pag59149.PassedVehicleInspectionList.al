

page 59149 "Passed Vehicle Inspection List"
{
    CardPageID = "Vehicle Inspection Card";
    PageType = List;
    SourceTable = "Vehicle Inspection";
    SourceTableView = where("Inspection Status" = const(Passed),
                            Posted = const(true));


    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Inspection No."; Rec."Inspection No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Inspection No. field.';
                }
                field("Registration No."; Rec."Registration No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Registration No. field.';
                }
                field(Type; Rec.Type)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Type field.';
                }
                field(Make; Rec.Make)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Make field.';
                }
                field(Model; Rec.Model)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Model field.';
                }
                field("Inspection Date"; Rec."Inspection Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Inspection Date field.';
                }
                field("Inspection Center"; Rec."Inspection Center")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Inspection Center field.';
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Amount field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

