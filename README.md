# Technolab Circulaire Wandeling
Een mobiele applicatie ter verrijking van de Singelpark Circulair-wandeling in samenwerking met de Gemeente Leiden.

## Installatie

> [!IMPORTANT]
> Deze workspace maakt gebruik van globale tools zoals [Dart SDK](https://dart.dev/get-dart) (3.9.2+), [FVM](https://fvm.app), [Melos](https://melos.invertase.dev) en [Dart Frog CLI](https://dartfrog.vgv.dev).

1. Configureer de globale tools:

```shell
dart pub global activate fvm
dart pub global activate melos
dart pub global activate dart_frog_cli
```

2. Kloon de GitHub-repository:

```shell
git clone git@github.com:Technolab-Leiden/TL-CIRCULAIRE-WANDELING.git
```

3. Navigeer naar de directory:

```shell
cd TL-CIRCULAIRE-WANDELING
```

4. Configureer Flutter via FVM:
```shell
fvm install
fvm use
```

5. Configureer de workspace:
```shell
melos bootstrap
```

6. Start de Flutter-applicatie:

```shell
melos run app:dev
```

7. Start de Dart Frog-applicatie:

```shell
melos run api:dev
```
