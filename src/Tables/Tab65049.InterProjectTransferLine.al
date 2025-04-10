
table 65049 "Inter-Project Transfer Line"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Document No"; Code[50])
        {
        }
        field(2; "Line No"; Integer)
        {
            AutoIncrement = true;
        }
        field(3; "Transfer-From Job No"; Code[50])
        {
            TableRelation = Job where(Status = filter(Planning | Open | Quote));

            trigger OnValidate()
            begin
                InterProjectHeader.Reset;
                InterProjectHeader.SetRange(No, "Document No");
                if InterProjectHeader.Find('-') then begin
                    if (InterProjectHeader."Transfer-To Job No" = "Transfer-From Job No") then
                        Error('Project you are Transfering to cannot be the same as project you are transfering from')
                    else
                        "Expensing Description" := InterProjectHeader."Posting Description";
                end;

                Project.Reset;
                Project.SetRange("No.", "Transfer-From Job No");
                if Project.Find('-') then begin
                    Project.TestField("Job Posting Group");
                    "Shortcut Dimension 1 Code" := Project."Global Dimension 1 Code";
                    "Shortcut Dimension 2 Code" := Project."Global Dimension 2 Code";
                end;
            end;
        }
        field(4; "Transfer-From Task No"; Code[50])
        {
            TableRelation = "Job Task"."Job Task No." where("Job No." = field("Transfer-From Job No"),
                                                             "Job Task Type" = const(Posting));

            // trigger OnValidate()
            // begin
            //     TaskRec.Reset;
            //     TaskRec.SetRange("Job No.", "Transfer-From Job No");
            //     TaskRec.SetRange("Job Task No.", "Transfer-From Task No");
            //     if TaskRec.Find('-') then begin
            //         TaskRec.CalcFields("Schedule (Total Cost)", "Remaining (Total Cost)", "Usage (Total Cost)", TaskRec.Commitments);
            //         "Job Task Name" := TaskRec.Description;
            //         "Job Available Budget (LCY)" := TaskRec."Schedule (Total Cost)";
            //         Commitments := TaskRec.Commitments;
            //         "Job Task Remaining Amount" := TaskRec."Schedule (Total Cost)" - (TaskRec."Usage (Total Cost)" + TaskRec.Commitments);
            //     end;
            // end;
        }
        field(5; "Transfer-From Expense G/L A/C"; Code[50])
        {
            TableRelation = "G/L Account";
        }
        field(6; "Expensing Description"; Code[50])
        {
        }
        field(7; "Currency Code"; Code[50])
        {
            TableRelation = Currency;
        }
        field(8; "Transfer Line Amount"; Decimal)
        {

            trigger OnValidate()
            begin
                if "Transfer Line Amount" > "Job Task Remaining Amount" then
                    Error('You can not transfer more than available amount of %1', "Job Task Remaining Amount");

                InterProjectHeader.Reset;
                InterProjectHeader.SetRange(No, "Document No");
                if InterProjectHeader.Find('-') then begin
                    "Currency Code" := InterProjectHeader."Currency Code";
                    "Currency Factor" := InterProjectHeader."Currency Factor";
                    "Transfer Line Amount LCY" := "Transfer Line Amount" * InterProjectHeader."Currency Factor";
                end;
                Message('currency Code %1,currency Factor %2', InterProjectHeader."Currency Code", InterProjectHeader."Currency Factor");
            end;
        }
        field(9; "Transfer Line Amount LCY"; Decimal)
        {
        }
        field(10; "Dimension Set ID"; Integer)
        {
            Caption = 'Dimension Set ID';
            Editable = false;
            TableRelation = "Dimension Set Entry";

            trigger OnLookup()
            begin
                ShowDocDim;
            end;
        }
        field(11; "Responsible Employee No"; Code[50])
        {
            TableRelation = Employee."No.";

            trigger OnValidate()
            begin
                if Emp.Get("Responsible Employee No") then begin
                    "Responsible Employee Name" := Emp."First Name" + ' ' + Emp."Middle Name" + ' ' + Emp."Last Name";
                end;
            end;
        }
        field(12; "Responsible Employee Name"; Code[50])
        {
        }
        field(13; "Job Available Budget (LCY)"; Decimal)
        {
        }
        field(14; "Shortcut Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,1,1';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1));

            trigger OnValidate()
            begin
                ValidateShortcutDimCode(1, "Shortcut Dimension 1 Code");
            end;
        }
        field(15; "Shortcut Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,1,2';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(2));

            trigger OnValidate()
            begin
                ValidateShortcutDimCode(2, "Shortcut Dimension 2 Code");
            end;
        }
        field(16; Commitments; Decimal)
        {
        }
        field(17; "Job Task Name"; Code[50])
        {
        }
        field(18; "Job Task Remaining Amount"; Decimal)
        {
        }
        field(19; "Project Manager"; Code[50])
        {
            TableRelation = Job."Person Responsible";
        }
        field(20; "Currency Factor"; Decimal)
        {
            Caption = 'Currency Factor';
            DecimalPlaces = 0 : 15;
            Editable = false;
            MinValue = 0;

            trigger OnValidate()
            begin
                //IF "Currency Factor" <> xRec."Currency Factor" THEN
                //UpdateSalesLinesByFieldNo(FIELDNO("Currency Factor"),FALSE);
            end;
        }
    }

    keys
    {
        key(Key1; "Document No", "Transfer-From Job No", "Transfer-From Task No", "Line No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        DimMgt: Codeunit DimensionManagement;
        TaskRec: Record "Job Task";
        Emp: Record Employee;
        InterProjectHeader: Record "Inter_Project Transfer Header";
        Project: Record Job;


    procedure ShowDocDim()
    var
        OldDimSetID: Integer;
    begin
        OldDimSetID := "Dimension Set ID";
        // "Dimension Set ID" :=
        //   DimMgt.EditDimensionSet2(
        //     "Dimension Set ID",StrSubstNo('%1 %2','',"Document No"),
        //     "Shortcut Dimension 1 Code","Shortcut Dimension 2 Code");
        /*IF OldDimSetID <> "Dimension Set ID" THEN BEGIN
          MODIFY;
        
        
          IF PurchLinesExist THEN
            UpdateAllLineDim("Dimension Set ID",OldDimSetID);
        END;*/

    end;

    local procedure GetCurrency()
    begin
        /*
          CurrencyCode := "Currency Code";
        
        IF CurrencyCode = '' THEN BEGIN
          CLEAR(Currency);
          Currency.InitRoundingPrecision
        END ELSE
          IF CurrencyCode <> Currency.Code THEN BEGIN
            Currency.GET(CurrencyCode);
            Currency.TESTFIELD("Amount Rounding Precision");
          END;
        */

    end;

    local procedure UpdateAllLineDim(NewParentDimSetID: Integer; OldParentDimSetID: Integer)
    var
        NewDimSetID: Integer;
    begin

        // Update all lines with changed dimensions.

        /*IF NewParentDimSetID = OldParentDimSetID THEN
          EXIT;
        IF NOT CONFIRM(Text051) THEN
          EXIT;
        
        PurchLine.RESET;
        //PurchLine.SETRANGE("Document Type","Document Type");
        PurchLine.SETRANGE(PurchLine.No,"No.");
        PurchLine.LOCKTABLE;
        IF PurchLine.FIND('-') THEN
          REPEAT
            NewDimSetID := DimMgt.GetDeltaDimSetID(PurchLine."Dimension Set ID",NewParentDimSetID,OldParentDimSetID);
            IF PurchLine."Dimension Set ID" <> NewDimSetID THEN BEGIN
              PurchLine."Dimension Set ID" := NewDimSetID;
              DimMgt.UpdateGlobalDimFromDimSetID(
                PurchLine."Dimension Set ID",PurchLine."Shortcut Dimension 1 Code",PurchLine."Shortcut Dimension 2 Code");
              PurchLine.MODIFY;
            END;
          UNTIL PurchLine.NEXT = 0;
          */

    end;

    local procedure ValidateShortcutDimCode(FieldNumber: Integer; var ShortcutDimCode: Code[20])
    var
        OldDimSetID: Integer;
    begin
        OldDimSetID := "Dimension Set ID";
        DimMgt.ValidateShortcutDimValues(FieldNumber, ShortcutDimCode, "Dimension Set ID");
        //IF "No." <> '' THEN
        //  MODIFY;

        /*IF OldDimSetID <> "Dimension Set ID" THEN BEGIN
          MODIFY;
          IF PurchLinesExist THEN
            UpdateAllLineDim("Dimension Set ID",OldDimSetID);
        END;*/

    end;
}

