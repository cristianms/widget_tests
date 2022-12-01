import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:widget_tests/cliente/domain/models/cliente.dart';
import 'package:widget_tests/cliente/domain/repositories/i_cliente_repository.dart';

class CapaPedido extends StatelessWidget {
  const CapaPedido({super.key});

  @override
  Widget build(BuildContext context) {
    final clienteRepository = Modular.get<IClienteRepository>();
    return Scaffold(
      appBar: AppBar(title: const Text('Pedido')),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            DropdownSelecaoCliente(
              listaClientes: clienteRepository.getAllClientes(),
            ),
          ],
        ),
      ),
    );
  }
}

class DropdownSelecaoCliente extends StatefulWidget {
  final List<Cliente> listaClientes;
  const DropdownSelecaoCliente({required this.listaClientes, super.key});

  @override
  State<DropdownSelecaoCliente> createState() => _DropdownSelecaoClienteState();
}

class _DropdownSelecaoClienteState extends State<DropdownSelecaoCliente> {
  late String dropdownValue;

  @override
  void initState() {
    dropdownValue = widget.listaClientes.first.fantasia;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: DropdownButtonHideUnderline(
        child: ButtonTheme(
          alignedDropdown: true,
          child: DropdownButton<String>(
            style: Theme.of(context).textTheme.titleMedium,
            value: dropdownValue,
            onChanged: (String? value) {
              setState(() => dropdownValue = value!);
            },
            items: widget.listaClientes.map<DropdownMenuItem<String>>((Cliente cliente) {
              return DropdownMenuItem<String>(
                value: cliente.fantasia,
                child: Text(cliente.fantasia),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
