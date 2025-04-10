Page 75133 "IFS Intention To Bid"
{
    Caption = 'Recurring Purchase Lines';
    DataCaptionFields = "Vendor No.";
    PageType = ListPart;
    SourceTable = "Standard Vendor Purchase Code";

    layout
    {
        area(content)
        {
            repeater(Control1)
            {

                field("Vendor No."; "Vendor No.")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the number of the vendor to which the standard purchase code is assigned.';
                    trigger OnValidate()
                    begin
                        myVendor.Reset;
                        myVendor.SetRange("No.", "Vendor No.");
                        if myVendor.FindFirst() then begin
                            rec."Primary Email" := myVendor."E-Mail";
                            Rec."Vendor Name" := myVendor.Name;
                            rec."Vendor Phone No." := myVendor."Phone No.";
                            //MODIFY(TRUE);
                        END;
                    END;
                }
                field("Vendor Name"; "Vendor Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Vendor Phone No."; "Vendor Phone No.")
                {
                    ApplicationArea = Basic;
                }
                field("Primary Email"; "Primary Email")
                {
                    ApplicationArea = Basic;
                }
                field("Code"; Code)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Description; Description)
                {
                    ApplicationArea = Basic;
                }
                field(Category; Category)
                {
                    ApplicationArea = Basic;

                    trigger OnValidate()
                    begin
                        // IF Code<>'' THEN BEGIN
                        // StandardPurchaseCode.RESET;
                        // StandardPurchaseCode.SETRANGE(Code,Code);
                        // IF StandardPurchaseCode.FINDFIRST THEN
                        //  IF StandardPurchaseCode."Procurement Category ID"='' THEN BEGIN
                        //    ERROR('ERROR! Ensure you have specified a category');
                        //    END ELSE BEGIN
                        //  Category:=StandardPurchaseCode."Procurement Category ID";
                        //      END;
                        // MODIFY(TRUE);
                        // END;
                    end;
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Update Supplier Details")
            {
                ApplicationArea = Basic;
                Image = UpdateDescription;

                trigger OnAction()
                begin
                    if Confirm('Are you sure you want to update this supplier email ?', true) then begin
                        myVendor.Reset;
                        myVendor.SetRange("No.", "Vendor No.");
                        if myVendor.FindSet then begin
                            "Primary Email" := myVendor."E-Mail";
                            "Vendor Name" := myVendor.Name;
                            "Invitation Email Sent" := false;
                            Modify(true);
                            Message('Email Updated');
                        end;
                    end;
                end;
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        // IF Code<>'' THEN BEGIN
        // StandardPurchaseCode.RESET;
        // StandardPurchaseCode.SETRANGE(Code,Code);
        // IF StandardPurchaseCode.FINDFIRST THEN
        //  IF StandardPurchaseCode."Procurement Category ID"='' THEN BEGIN
        //    ERROR('ERROR! Ensure you have specified a category');
        //    END ELSE BEGIN
        //  Category:=StandardPurchaseCode."Procurement Category ID";
        //      END;
        // MODIFY(TRUE);
        // END;
        UserSetup.Reset;
        UserSetup.SetRange("User ID", UserId);
        if UserSetup.FindSet then begin
            if UserSetup."Procurement Manager" = false or UserSetup."Procurement Manager" = false then
                Error('You Do Not Have Sufficient Rights To List,Kindly Contact SCM Department!');
        end;
    end;

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        // IF Code<>'' THEN BEGIN
        // StandardPurchaseCode.RESET;
        // StandardPurchaseCode.SETRANGE(Code,Code);
        // IF StandardPurchaseCode.FINDFIRST THEN
        //  IF StandardPurchaseCode."Procurement Category ID"='' THEN BEGIN
        //    ERROR('ERROR! Ensure you have specified a category');
        //    END ELSE BEGIN
        //  Category:=StandardPurchaseCode."Procurement Category ID";
        //      END;
        // MODIFY(TRUE);
        // END;
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        // IF Code<>'' THEN BEGIN
        // StandardPurchaseCode.RESET;
        // StandardPurchaseCode.SETRANGE(Code,Code);
        // IF StandardPurchaseCode.FINDFIRST THEN
        //  IF StandardPurchaseCode."Procurement Category ID"='' THEN BEGIN
        //    ERROR('ERROR! Ensure you have specified a category');
        //    END ELSE BEGIN
        //  Category:=StandardPurchaseCode."Procurement Category ID";
        //      END;
        // MODIFY(TRUE);
        // END;
    end;

    trigger OnOpenPage()
    begin
        // StandardPurchaseCode.Reset;
        // StandardPurchaseCode.SetRange(Code, Code);
        // if StandardPurchaseCode.FindSet then begin
        //     if (StandardPurchaseCode.Status <> StandardPurchaseCode.Status::Open) then begin
        //         CurrPage.Editable(false);
        //     end;
        // end;
        UserSetup.Reset;
        UserSetup.SetRange("User ID", UserId);
        if UserSetup.FindSet then begin
            if UserSetup."Procurement Manager" = false or UserSetup."Procurement Manager" = false then
                Error('You Do Not Have Sufficient Rights To List,Kindly Contact SCM Department!');
        end;
    end;

    var
        StandardPurchaseCode: Record "Standard Purchase Code";
        myVendor: Record Vendor;
        UserSetup: Record "User Setup";

    procedure GetSelected(var StdVendPurchCode: Record "Standard Vendor Purchase Code")
    begin
        CurrPage.SetSelectionFilter(StdVendPurchCode);
    end;
}

