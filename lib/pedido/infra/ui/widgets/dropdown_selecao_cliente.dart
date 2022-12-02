import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:widget_tests/cliente/domain/models/cliente.dart';
import 'package:widget_tests/pedido/infra/ui/providers/pedido_provider.dart';

class DropdownSelecaoCliente extends StatefulWidget {
  final List<Cliente> listaClientes;
  const DropdownSelecaoCliente({required this.listaClientes, super.key});

  @override
  State<DropdownSelecaoCliente> createState() => _DropdownSelecaoClienteState();
}

class _DropdownSelecaoClienteState extends State<DropdownSelecaoCliente> {
  late Cliente clienteSelecionado;

  @override
  void initState() {
    clienteSelecionado = widget.listaClientes.first;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: DropdownButtonHideUnderline(
        child: ButtonTheme(
          alignedDropdown: true,
          child: DropdownButton<Cliente>(
            style: Theme.of(context).textTheme.titleMedium,
            value: clienteSelecionado,
            onChanged: (Cliente? novoClienteSelecionado) {
              setState(() {
                clienteSelecionado = novoClienteSelecionado!;
                Provider.of<PedidoProvider>(context, listen: false).pedido!.cliente = novoClienteSelecionado;
              });
            },
            items: widget.listaClientes.map<DropdownMenuItem<Cliente>>((Cliente cliente) {
              return DropdownMenuItem<Cliente>(
                value: cliente,
                child: Text(cliente.fantasia),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
