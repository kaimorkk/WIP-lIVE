TableExtension 52193556 tableextension52193556 extends "VAT Registration No. Format" 
{
    Caption = 'VAT Registration No. Format';
    fields
    {
        modify("Country/Region Code")
        {
            Caption = 'Country/Region Code';
        }
        modify("Line No.")
        {
            Caption = 'Line No.';
        }
        modify(Format)
        {
            Caption = 'Format';
        }
    }

    //Unsupported feature: Property Modification (TextConstString) on "Text000(Variable 1000)".

    //var
        //>>>> ORIGINAL VALUE:
        //Text000 : ENU=The entered VAT Registration number is not in agreement with the format specified for Country/Region Code %1.\;
        //Variable type has not been exported.
        //>>>> MODIFIED VALUE:
        //Text000 : ENU=The entered VAT Registration number is not in agreement with the format specified for Country/Region Code %1.\;ESM=El nº reg. IVA introducido no es acorde con el formato especificado para el Cód. país/región %1.\;FRC=Le n° identif. TPS/TVH entré n'est pas conforme au format spécifié pour le code pays/région %1.\;ENC=The entered GST/HST Registration Number is not in agreement with the format specified for Country/Region Code %1.\;
        //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text001(Variable 1001)".

    //var
        //>>>> ORIGINAL VALUE:
        //Text001 : ENU=The following formats are acceptable: %2;
        //Variable type has not been exported.
        //>>>> MODIFIED VALUE:
        //Text001 : ENU=The following formats are acceptable: %2;ESM=Los siguientes formatos son aceptables: %2;FRC=Le(s) format(s) suivant(s) est (sont) accepté(s) : %2;ENC=The following formats are acceptable: %2;
        //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text002(Variable 1002)".

    //var
        //>>>> ORIGINAL VALUE:
        //Text002 : ENU=This VAT registration number has already been entered for the following customers:\ %1;
        //Variable type has not been exported.
        //>>>> MODIFIED VALUE:
        //Text002 : ENU=This VAT registration number has already been entered for the following customers:\ %1;ESM=Este nº reg. IVA se ha introducido ya para los siguientes clientes:\ %1;FRC=Ce n° identif. TPS/TVH a déjà été entré pour le client suivant : \%1;ENC=This GST/HST registration number has already been entered for the following customers:\ %1;
        //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text003(Variable 1003)".

    //var
        //>>>> ORIGINAL VALUE:
        //Text003 : ENU=This VAT registration number has already been entered for the following vendors:\ %1;
        //Variable type has not been exported.
        //>>>> MODIFIED VALUE:
        //Text003 : ENU=This VAT registration number has already been entered for the following vendors:\ %1;ESM=Este nº reg. IVA se ha introducido ya para los siguientes proveedores:\ %1;FRC=Ce n° identif. TPS/TVH a déjà été entré pour le fournisseur suivant : \%1;ENC=This GST/HST registration number has already been entered for the following vendors:\ %1;
        //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text004(Variable 1004)".

    //var
        //>>>> ORIGINAL VALUE:
        //Text004 : ENU=This VAT registration number has already been entered for the following contacts:\ %1;
        //Variable type has not been exported.
        //>>>> MODIFIED VALUE:
        //Text004 : ENU=This VAT registration number has already been entered for the following contacts:\ %1;ESM=Este nº reg. IVA se ha introducido ya para los siguientes contactos:\ %1;FRC=Ce n° identif. TPS/TVH a déjà été entré pour le contact suivant : \%1;ENC=This GST/HST registration number has already been entered for the following contacts:\ %1;
        //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text005(Variable 1005)".

    //var
        //>>>> ORIGINAL VALUE:
        //Text005 : ENU=ABCDEFGHIJKLMNOPQRSTUVWXYZ;
        //Variable type has not been exported.
        //>>>> MODIFIED VALUE:
        //Text005 : ENU=ABCDEFGHIJKLMNOPQRSTUVWXYZ;ESM=ABCDEFGHIJKLMNÑOPQRSTUVWXYZ;FRC=ABCDEFGHIJKLMNOPQRSTUVWXYZ;ENC=ABCDEFGHIJKLMNOPQRSTUVWXYZ;
        //Variable type has not been exported.
}

