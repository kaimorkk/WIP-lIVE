

page 70067 "Financial Evaluation"
{
    DeleteAllowed = false;
    InsertAllowed = false;
    PageType = List;
    SourceTable = "Quotations Evaluation";
    SourceTableView = where("Passes Technical?" = const(true),
                            "Item Description" = filter(<> ''),
                            created = const(true));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Ref No."; Rec."Ref No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Ref No. field.';
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Name field.';
                }
                field("Item Description"; Rec."Item Description")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Item Description field.';
                }
                field("Financial Amount"; Rec."Financial Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Financial Amount field.';
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Proceed to Award?")
            {
                ApplicationArea = Basic;
                Image = WorkCenterLoad;
                ToolTip = 'Executes the Proceed to Award? action.';
                trigger OnAction()
                var
                    rec5: Record "Procurement Request";
                begin
                    rec5.Reset;
                    rec5.Get(Rec."Ref No.");
                    if rec5."In Award?" = true then begin
                        Error('The Quotation is already in award stage!');
                    end;

                    Rec.SetFilter("Financial Amount", '<>%1', 0);
                    if Rec.FindSet then begin
                        rec5.Reset;
                        rec5.Get(Rec."Ref No.");
                        rec5."In Award?" := true;
                        rec5."Financial in Progress?" := true;
                        rec5.Modify;
                        Message('Please Proceed in a separate Window');
                        CurrPage.Close;
                    end;
                    if not Rec.FindSet then begin
                        Error('Please Fill in the Financial Amount(s).!!!');
                    end;
                end;
            }
        }
        area(Promoted)
        {
            group(Category_Process)
            {
                actionref("Proceed to Award?_Promoted"; "Proceed to Award?")
                {
                }
            }
        }
    }
}

#pragma implicitwith restore

